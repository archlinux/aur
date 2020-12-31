# Maintainer: Zoey Sheffield <me at zoey dot fyi>

pkgname='boop-gtk-extra-scripts'
pkgver='aad8f75' # last commit in the Scripts folder of https://github.com/IvanMathy/Boop
pkgrel='1'
pkgdesc="Extra scripts for Boop-GTK"
arch=('x86_64')
conflicts=()
provides=()
url='https://github.com/IvanMathy/Boop/tree/main/Scripts'
license=('MIT')
depends=("boop-gtk>=1.6.0")
source=("Boop::git+https://github.com/IvanMathy/Boop#commit=$pkgver")
sha512sums=('SKIP')

package() {
  # https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
  config_dirs="${XDG_CONFIG_DIRS:-/etc/xdg}"

  for script in Boop/Scripts/*.js
  do
    f="$(basename -- $script)"
    install -Dm644 "$script" "$pkgdir/$config_dirs/boop-gtk/scripts/$f"
  done
}
