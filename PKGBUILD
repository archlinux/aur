# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=ryzenadj-controller-git
_gitdir=ryzenadj-controller
pkgver=1.0.0
pkgrel=1
pkgdesc="Python module that provides a userspace interface for RyzenAdj using Unix Sockets"
arch=('any')
url="https://github.com/ShadowBlip/ryzenadj-controller"
license=('GPL')
groups=()
depends=('python' 'ryzenadj-git')
optdepends=()
makedepends=('git')
_tag=1.0.0
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
package() {
	cd "$srcdir/${_gitdir}"
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/share/ryzenadj-controller/scripts
	install -m644 usr/lib/systemd/system/ryzenadj-controller.service ${pkgdir}/usr/lib/systemd/system
	install -m744 usr/share/ryzenadj-controller/scripts/ryzenadj-controller.py ${pkgdir}/usr/share/ryzenadj-controller/scripts
	install -m744 usr/share/ryzenadj-controller/scripts/support.py ${pkgdir}/usr/share/ryzenadj-controller/scripts
}
