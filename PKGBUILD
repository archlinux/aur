# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-mines
pkgver=0.1.0
pkgrel=1
pkgdesc="A text-based user interface implimentation of the classic  mine sweeping puzzle game"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'ttf-font-nerd')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7b429cf1bb4f3841c36ce6165d173de7e68bcbd815d59d2182b1b00934c66338')

prepare() {
  cd "$pkgname-$pkgver"
  echo -e "#Width of the matrix
WIDTH=10
#Width of the matrix
HEIGHT=10

#Number of mines in the matrix
MINES_QUANTITY=10

#Text editor to open config file
PREFERRED_EDITOR=${EDITOR-nano}

#Acceptable notification togle values: yes / no
NOTIFICATION_TOGGLE=yes

#Acceptable notification toggle values: yes / no. This can also be controlled while playing
CHEATSHEET_TOGGLE=yes

#Color output. Acceptable notification toggle values: yes / no.
COLOR_TOGGLE=yes

#Blink effect toggle. Acceptable notification toggle values: yes / no.
BLINK_TOGGLE=yes

#Key binding to flag squares. Non acceptable values: Upper-case,q,i, arrow keys, navigation key-bindings.
FLAG_BIND=f

#Key binding to reveal squares. Spacebar is hardcoded, also. Non acceptable values: Upper-case,q,i, arrow keys, navigation key-bindings.
REVEAL_BIND=r

# Key binding for quick solving around squares with adequately flagged squares around them. Non acceptable values: Upper-case,q,i, arrow keys, navigation key-bindings.
QUICK_SOLVE_BIND=e

# Character (simple or nerd-font) to represent the MINE.
# Suggestions:󰷚,🕱,☢,☠,,󰚑,󰚌,󰯆,󰯈,󰇷,󰱵,*,A-Z
MINE_CHAR=󰷚

# Character (simple or nerd-font) to represent the FLAGGED SQUARE.
# Suggestions:󰈻,󰈽,,,󰈿,󰉀,󰈾,󰒡,󰲉,,󰜺,,,!,#,A-Z
FLAG_CHAR=󰈻

#Acceptable values for navigation keys: vim, aswd. Arrow keys are hardcoded and work in all options.
NAVIGATION_KEYS=vim">$pkgname.config
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/$pkgname/$pkgname.png"
  install -Dm644 $pkgname.config "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
