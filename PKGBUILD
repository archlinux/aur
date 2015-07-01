# Contributor: Vojtech Horky <AUR / hotspur>

pkgname=bash-completion-pandoc-git
pkgver=1.2.r26.gbb2b1a3
pkgrel=2
pkgdesc="Bash completion support for Pandoc"
arch=('any')
url="https://github.com/dsanson/pandoc-completion"
license=('custom')
depends=('bash')
makedepends=('git')
provides=('bash-completion-pandoc')
source=("$pkgname"::'git://github.com/dsanson/pandoc-completion.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	install -d "${pkgdir}/etc/bash_completion.d"
	install "${srcdir}/${pkgname}/pandoc-completion.bash" "${pkgdir}/etc/bash_completion.d/pandoc"
}
