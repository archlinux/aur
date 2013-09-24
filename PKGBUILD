# Maintainer: Marek Kubica <marek@xivilization.net>
pkgname=git-cal-git
pkgver=r22
pkgrel=1
pkgdesc='github like contributions calendar on terminal'
arch=('any')
url='https://github.com/k4rthik/git-cal'
license=('MIT')
depends=('perl>=5.10.0')
makedepends=("git")
options=('!emptydirs')
source=("$pkgname"::"git+https://github.com/k4rthik/git-cal.git")
sha512sums=(SKIP)

pkgver() {
	cd "$pkgname"
	# git describe can't describe anything without tags
	local ver="$(git log --oneline | wc -l)"
	printf "r%s" "${ver//-/.}"
}

package() {
	cd "$pkgname"
	install -D -m755 git-cal "$pkgdir"/usr/bin/git-cal
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
