# Maintainer: Marek Kubica <marek@xivilization.net>
pkgname=git-cal-git
pkgver=0.0.r71.d2cdf42
pkgrel=1
pkgdesc='github like contributions calendar on terminal'
arch=('any')
url='https://github.com/k4rthik/git-cal'
license=('MIT')
depends=('perl>=5.10.0'
         'perl-libwww')
makedepends=("git")
options=('!emptydirs')
source=("$pkgname"::"git+https://github.com/k4rthik/git-cal.git")
sha512sums=(SKIP)

pkgver() {
	cd "$pkgname"
	# git describe can't describe anything without tags
	printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
}

package() {
	cd "$pkgname"
	install -D -m755 git-cal "$pkgdir"/usr/bin/git-cal
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
