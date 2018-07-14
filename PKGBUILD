# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: mentallaxative <laxatives@gmail.com>

pkgname=rubyroom
pkgver=0.4
pkgrel=5
pkgdesc='Ruby clone of the Whiteroom full-screen text editor'
arch=('x86_64')
url='http://rubyroom.rubyforge.org/'
license=('GPL2')
depends=('ruby-gtk2')
makedepends=('gendesk' 'git')
optdepends=('fortune-mod: for inserting fortunes')
source=("git://github.com/xyproto/rubyroom.git#tag=$pkgver"
        'rubyroom.png')
sha256sums=('SKIP'
            '4796736d8d63553479c871194559f5f8986681bbfa7a169a9998298c6b7053bf')

prepare() {
  gendesk -f \
    --pkgname="$pkgname" \
    --pkgdesc="You, your text and yourself" \
    --categories "Office;" \
    --name='RubyRoom'
}

package() {
  install -Dm755 "$pkgname/$pkgname.rb" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rubyroom.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: ts=2 sw=2 et:
