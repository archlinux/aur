# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# from: git

pkgname=git-cal-git
pkgver=r96.b3bb376
pkgrel=4
pkgdesc='github like contributions calendar on terminal'
arch=('any')
url='https://github.com/k4rthik/git-cal'
license=('MIT')
depends=('perl>=5.10.0')
makedepends=("git")
options=('!emptydirs')
source=("$pkgname"::"git+https://github.com/k4rthik/git-cal.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# git describe can't describe anything without tags
	printf "r%d.%s\n" "$(git rev-list HEAD --count)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -D -m755 git-cal "$pkgdir"/usr/bin/git-cal
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
