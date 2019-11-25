# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Yardena Cohen <yardenack at gmail dot org>

gitname=mat
pkgname=${gitname}-git
pkgver=0.6.1.12.g4b9a657
pkgrel=2
pkgdesc="Metadata anonymisation toolkit (git version)"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
conflicts=('mat')
provides=('mat')
depends=('python2-distutils-extra' 'python2' 'hachoir-core' 'hachoir-parser' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'python2-mutagen' 'python2-gobject' 'git')
optdepends=('perl-image-exiftool: extended image support')
source=("git+https://0xacab.org/mat/mat.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
pkgver() {
	cd "${srcdir}/${gitname}"
	local ver="$(git describe --tags)"
	printf "%s" "${ver//-/.}"
}
package() {
	cd "${srcdir}/${gitname}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
