# Maintainer: Pawan Neupane <pawan148 at gmail dot com>
# Contributor: Rhys Perry <rhysperry111 at gmail dot com>

pkgbase=nocturnal-themes-git
_gitname=rtl88-Themes
pkgname=nocturnal-themes-git

pkgver=1.0.r103.g27583a6
pkgrel=1
pkgdesc='A GTK, xfwm4, openbox-3, and GNOME-Shell - Dark Mode Theme'
arch=('any')
url="https://github.com/rtlewis88/rtl88-Themes/tree/Nocturnal"
license=('custom:CC BY-SA')
conflicts=('nocturnal-themes')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gtk-engines: for gtk2 themes')
makedepends=('git')
md5sums=()

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo 'Downloading themes ...'
  if [[ -d ${_gitname} ]]; then
    rm -rf ${_gitname}
  fi
  git clone --single-branch --branch "Nocturnal" "https://github.com/rtlewis88/rtl88-Themes.git"
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir/usr/share/themes"
  mkdir -p "$DESTDIR"
    cp -r Nocturnal "$DESTDIR/"
    cp -r Nocturnal-Blue "$DESTDIR/"
}

