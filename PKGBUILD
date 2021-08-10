#Maintainer: Sanskrit Coders <sanskrit-programmers@googlegroups.com>
pkgname=sanskrit-fonts
pkgver=r41.5125855
pkgrel=1
pkgdesc="Various unicode fonts for Sanskrit (Scripts: Devanagari, Kannada, Tamil, Telugu, Malayalam, Oriya). Fonts include: Siddhanta, Chandas, Uttara, Sanskrit2003, Noto Sans Devanagari."
url="http://github.com/indic-transliteration/sanskrit-fonts"
license=('custom:OFL')
arch=(any)
makedepends=('git')

source=("git+https://github.com/indic-transliteration/sanskrit-fonts.git")
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
md5sums=('SKIP')


package() {
	install -d "$pkgdir/usr/share/fonts/sanskrit-fonts/"
  cp -rf "$srcdir/sanskrit-fonts/fonts"/* "$pkgdir/usr/share/fonts/sanskrit-fonts/"
}

# Explicitly calling mkfontscale and mkfontdir with post_install or post_upgrade, as in https://aur.archlinux.org/cgit/aur.git/tree/?h=ttf-siddhanta doesn't seem to be needed as those programs run automatically anyway. Same is assumed to be true of `fc-cache -fs >/dev/null`
