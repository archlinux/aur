# Maintainer: WinnerWind <archaur543258@winnerwind.in>
pkgrel=1
pkgver=0.44.27
pkgname=late-sh-cli-bin
pkgdesc='Companion CLI for the Late.sh terminal clubhouse (prebuilt version)'
arch=(x86_64)
url='https://late.sh'
groups=('late.sh')
source=("late::https://cli.late.sh/latest/x86_64-unknown-linux-gnu/late")
sha256sums=('SKIP')
makedepends=('jq')

pkgver() {
	# trick to get the latest release number from github
	curl -s "https://api.github.com/repos/mpiorowski/late-sh/releases/latest" | jq -r '.tag_name' | sed 's/[^0-9.]//g'
}

package() {
	install -Dm755 "${srcdir}/late" "${pkgdir}/usr/bin/late"
}

