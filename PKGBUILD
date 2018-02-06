# Current Maintainer : Matthew Hague <matthewhague@zoho.com>
# Original Maintainer : a-sk <askurihin at gmail dot com>
_npmname=imapnotify
pkgname=nodejs-$_npmname
pkgver=0.4.1
pkgrel=9
pkgdesc="Execute scripts on new messages using IDLE imap command"
arch=(any)
url="http://github.com/a-sk/node-imapnotify"
license=(MIT)
depends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        imapnotify@.service)
noextract=($_npmname-$pkgver.tgz)
optdepends=()
makedepends=('npm')
install=$pkgname.install
sha1sums=(efc694293876591a9ad8173c26273568ae122e5c
          1e82f19dffcfc2db30047f6788a91a1f9a138a65)

package() {
    npm install --cache "${srcdir}/npm-cache" -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
