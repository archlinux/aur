# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=unpack-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper script for handling multiple archive formats"
arch=('any')
url="https://github.com/githaff/unpack"
license=('BSD')
depends=('sh')
makedepends=()
optdepends=('bzip2: bz2 support'
	    'gzip: gz support'
	    'xz: xz support'
	    'lzop: lzo support'
	    'rpm-org: rpm support'
	    'unrar: rar support'
	    'unzip: zip support'
	    'p7zip: 7z support')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/githaff/unpack.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	./unpack --version
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -D -m755 unpack "${pkgdir}/usr/bin/unpack"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
