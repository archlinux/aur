# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=6.2.1
pkgrel=1
pkgdesc="An all purpose Java bytecode manipulation and analysis framework"
arch=('any')
url="http://asm.ow2.org/"
license=('BSD')
depends=('java-runtime')
_maven_central='http://repo.apache.maven.org/maven2'
source=("${_maven_central}/org/ow2/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-analysis/${pkgver}/${_pkgname}-analysis-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-commons/${pkgver}/${_pkgname}-commons-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-tree/${pkgver}/${_pkgname}-tree-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-util/${pkgver}/${_pkgname}-util-${pkgver}.jar"
        "${_maven_central}/org/ow2/${_pkgname}/${_pkgname}-xml/${pkgver}/${_pkgname}-xml-${pkgver}.jar"
        LICENSE)


package() {
  mkdir -p ${pkgdir}/usr/share/{java/$_pkgname,licenses/$pkgname}

  cd "${srcdir}"

  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  for i in *.jar; do
    install -m 644 ${i} ${pkgdir}/usr/share/java/${_pkgname}
    _tmpfilename=${i##*\/}
    ln -sf ${_tmpfilename} ${pkgdir}/usr/share/java/${_pkgname}/${_tmpfilename/-[0-9]\.[0-9]/}
  done
}

sha256sums=('1460db6c33cc99c84e5cb30e46b017e4d1cc9a7fbc174101d6f84829bb64c085'
            '4c9342c98e746e9c2d7f2cdc6896f7348317e9b1e5a6c591047fc8969def4b23'
            '3f578d31ef30f94b6d1f44812f41fe4f98a7cd42af35335f5d4866ab3b901865'
            'a520b54c7be4e07e533db8420ddf936fe8341ff56a5df255bab584478dd90aab'
            'f747f70912e918872c0fe07ef227ff03b2b38fde94778502df7af133f8c8fcc6'
            '361d2018f3262698c94837fcdea91059b2afeba11ecc109f618979561c36ebbf'
            '02f021ae8f8f2f205d36b20790eedd6a871dd3007ddf160c8692b6f3a3284fc7')
