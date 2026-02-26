pkgname=cohesivemail-bin
pkgver=0.0.73
pkgrel=1
pkgdesc="CohesiveMail desktop client"
arch=("x86_64")
url="https://dl.actuallyreliable.com/apps"
license=("custom")
depends=(
  "gtk3"
  "nss"
  "libx11"
  "libxext"
  "libxrandr"
  "libxrender"
  "libxi"
  "libxfixes"
  "libxdamage"
  "libxcomposite"
  "libxcursor"
  "libxkbcommon"
  "alsa-lib"
  "mesa"
  "glib2"
  "pango"
  "at-spi2-core"
  "dbus"
)
provides=("cohesivemail")
conflicts=("cohesivemail")
source=("https://dl.actuallyreliable.com/apps/cohesivemail-x86-v${pkgver}.tar.gz")
sha256sums=("821e48a89a3602db152b2af882b80943e0cfe68391a4b28ad93779beee79cb21")

package() {
  install -d "$pkgdir/opt/cohesivemail"
  cp -a "$srcdir"/* "$pkgdir/opt/cohesivemail/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/cohesivemail/cohesivemail "$pkgdir/usr/bin/cohesivemail"
}
