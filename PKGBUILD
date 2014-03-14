# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Yardena Cohen <yardenack at gmail dot org>

gitname=mat
pkgname=mat-git
pkgver=0.5.1
pkgrel=1
pkgdesc="Metadata anonymisation toolkit (git version)"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
depends=('python2-distutils-extra' 'python2' 'hachoir-core' 'hachoir-parser' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'mutagen' 'python2-gobject' 'git')
optdepends=('perl-image-exiftool: extended image support')
source=("git+https://git.torproject.org/user/jvoisin/mat.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${gitname}"
	local ver="$(git describe --tags)"
	printf "%s" "${ver//-/.}"
}
package() {
	cd "${srcdir}/${gitname}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
