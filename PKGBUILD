# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: David Phillips <dbphillipsnz@gmail.com>

_pkgname="annepro2-tools"
pkgname="$_pkgname-git-bin"
pkgver=r38.fe5ed65
pkgrel=1
pkgdesc="Alternative firmware update tool for the Anne Pro 2 keyboard (binary git version)"
arch=('x86_64')
url="https://github.com/OpenAnnePro/AnnePro2-Tools"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/OpenAnnePro/AnnePro2-Tools.git"
        "https://ci.codetector.org/job/OpenAnnePro/job/AnnePro2-Tools/job/master/lastSuccessfulBuild/artifact/target/release/annepro2_tools_linux_x64")
sha512sums=('SKIP'
            '6d42b807f22572917713d0df47be6eb1bd06204b340d2d9ac7c0d8ec06ee8acbbe64b27c2196d8ce224e39f2eb17a951e94bd80e1b5e35f0e776f67e71507048')

pkgver() {
	cd "$srcdir/AnnePro2-Tools"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
	install -Dm 755 annepro2_tools_linux_x64 "${pkgdir}/usr/bin/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
