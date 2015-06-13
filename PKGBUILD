# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: frank604 <frankshin82 at gmail>
# Maintainer: youngunix <zagazaw2004 'at' gmail 'dot' com>
# Maintainer: Jeremy L <jl AT adminempire DOT com>
# Contributer - Upstream Maintainer: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributer: graysky <graysky AT archlinux DOR us>

_pkgname=archey3
pkgname=${_pkgname}-git
pkgver=161
pkgrel=1
pkgdesc="Python script to display system infomation alongside the Arch Linux logo."
arch=('any')
url="http://bluepeppers.github.com/archey3"
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=(
'python-mpd-git: python libary for mpd interaction',
'python-logbook-git: for logging'
'imagemagick: for default screenshot command'
)
conflicts=('archey' 'archey3')
provides=('archey')
source="git+https://github.com/bluepeppers/archey3.git"
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

package() {
	cd "$_pkgname"
	python setup.py install --root=${pkgdir}
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
}
