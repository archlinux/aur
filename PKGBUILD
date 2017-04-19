# Maintainer: Alexander Phinikarides <alexisph@gmail.com>
pkgname=bfg
pkgver=1.12.15
pkgrel=2
pkgdesc='Removes large or troublesome blobs like git-filter-branch does, but faster. And written in Scala.'
arch=('any')
url='http://rtyley.github.io/bfg-repo-cleaner/'
license=('GPL3')
depends=('java-environment' 'bash')
source=("https://repo1.maven.org/maven2/com/madgag/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar"
        "${pkgname}.sh")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('330af214a0fed320c591afc1046b0f31e8a438f290da09672973aeaa6411b09d'
            'a41ad8ff48364c1118e69f5c1c6c5c070d56ad1d2f9cd09bca3c095385a6b530')

package() {
	cd "${srcdir}"
	install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
