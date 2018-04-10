# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=imgdupes
pkgver=1.2
pkgrel=1
pkgdesc='Checks for duplicated images in a directory tree, ignoring metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python2-texttable' 'python2-jpegtran-cffi')
license=('GPL3')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('838ab269184d8b2cf747ad8fe4a34ce32f2e9f6b74b9b2d2e28b409e0736b9118408ba15a2d28e04cffd2dee3ebc9f30a97bf5229f8959ea7223acf33f7cbafb')

prepare() {
	patch "${srcdir}/imgdupes-${pkgver}/imgdupes.py" << EOF
1c1
< #!/usr/bin/python
---
> #!/usr/bin/python2
EOF
}

package() {
	install -Dm755 "${srcdir}/imgdupes-${pkgver}/imgdupes.py" "${pkgdir}/usr/bin/imgdupes"
	install -Dm644 "${srcdir}/imgdupes-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
