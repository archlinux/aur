# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_pkgname=asm
pkgname=java-${_pkgname}
pkgver=6.2
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

sha256sums=('917bda888bc543187325d5fbc1034207eed152574ef78df1734ca0aee40b7fc8'
            '62b2c0d818fde5c52cf6404aa10836dbb170a2c3fa8466e656f0f991732fa01f'
            '15545913db06c987aa404f028e33501d9f27f8ced612f73727e3547ac4de878c'
            '02317d9ed739dab470a96f44de712fde51a811362ca26852b34324388e61257c'
            'f2820ea6ef069b83f37d805f5cec58b2872a25650f5f95b4f3cc572156323df0'
            'b0362758957b49cd68f4f8a22235b0f3de74c1c3a217e9ef5bd42c3ed00e91b4'
            '02f021ae8f8f2f205d36b20790eedd6a871dd3007ddf160c8692b6f3a3284fc7')
