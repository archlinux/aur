# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=chunker-cli
pkgver=1.4.4
pkgrel=1
pkgdesc="Convert Minecraft worlds between Java Edition and Bedrock Edition"
arch=("x86_64")
url="https://oss.chunker.app/"
license=("MIT")
depends=("java-runtime")

source=("https://github.com/HiveGamesOSS/Chunker/releases/download/${pkgver}/${pkgname}-${pkgver}.jar"
		"${pkgname}-${pkgver}-license::https://github.com/HiveGamesOSS/Chunker/raw/refs/heads/main/LICENSE"
		"chunker-cli.sh")

b2sums=("0b4b92db1b4a0d80326da8baffc2d5d20970d923838200ae9963a04138b10098bb2e01acde69ee534b24d64dbbd8ff0b7de0ff26f8e83e6504eb6622054e90f0"
		"da9186807f66a03130a5443cd3ae2b43e8945f0181495e15b4666167942860f67f73ff62324409f521823054573d604de64b28de832e6b6fd338c5544bed57d7"
		"45ea165133e4319a3dd20b0f5155817c2f00c5d17c4c702f3bb7233a2ae5573354d12721790bca096b58e795c3326c86d3cf8d607da37e30a23b62c46e683f55")

package() {
	install -D -m0644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -D -m0755 "${srcdir}/chunker-cli.sh" "${pkgdir}/usr/bin/chunker-cli"
	install -D -m0644 "${srcdir}/${pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
