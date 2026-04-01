# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=chunker-cli
pkgver=1.16.0
pkgrel=1
pkgdesc="Convert Minecraft worlds between Java Edition and Bedrock Edition"
arch=("any")
url="https://oss.chunker.app/"
license=("MIT")
depends=("java-runtime")

source=("https://github.com/HiveGamesOSS/Chunker/releases/download/${pkgver}/${pkgname}-${pkgver}.jar"
  "${pkgname}-${pkgver}-license::https://github.com/HiveGamesOSS/Chunker/raw/refs/heads/main/LICENSE"
  "${pkgname}.sh")

b2sums=("2a5382ffeaf1bf8f994044083745910db06051bceca551a93be96d0a97a0d60fb9f5c80019488b4bf84beb6e211b3a7c20f03b3b62c446a47f2301920ac4dba6"
  "da9186807f66a03130a5443cd3ae2b43e8945f0181495e15b4666167942860f67f73ff62324409f521823054573d604de64b28de832e6b6fd338c5544bed57d7"
  "45ea165133e4319a3dd20b0f5155817c2f00c5d17c4c702f3bb7233a2ae5573354d12721790bca096b58e795c3326c86d3cf8d607da37e30a23b62c46e683f55")

package() {
  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -D -m0755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
