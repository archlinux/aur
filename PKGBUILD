# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=zsh-uv-env
pkgname=${_pkgname}-git
pkgver=r9.6a4b901
pkgrel=1
pkgdesc="Automatically activates a virtual environment based on the current directory "
arch=(any)
url="https://github.com/matthiasha/zsh-uv-env"
license=("MIT")
depends=("zsh")
makedepends=("git")
source=(git+${url})
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/zsh-uv-env.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
