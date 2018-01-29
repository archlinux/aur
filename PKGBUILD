# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=helm-system-packages-git
pkgver=2017.12.28.ga91e7ac
pkgrel=1
pkgdesc="A Helm interface to your package manager"
arch=("any")
url="https://github.com/emacs-helm/helm-system-packages"
license=("GPL")
depends=("emacs")
makedepends=("git")
provides=("helm-system-packages")
conflicts=("helm-system-packages")
source=("git+https://github.com/emacs-helm/helm-system-packages")
sha1sums=("SKIP")

pkgver() {
	cd "$srcdir"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
	cd "$srcdir/helm-system-packages"
	make -C "stand-alone" DESTDIR="$pkgdir" install
}
