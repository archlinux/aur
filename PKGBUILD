# Maintainer :       Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard
pkgver=3.1
pkgrel=1

pkgdesc='Simple interface to auto-configure neomutt and isync with safe passwords'
arch=('any')
url="https://github.com/lukesmithxyz/$pkgname"
license=('GPL3')

depends=('neomutt' 'isync' 'msmtp' 'notmuch-runtime' 'pass' 'curl')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
            'protonmail-bridge: use neomutt with protonmail accounts'
            'pam-gnupg: automatically unlock gpg keys at session login'
            'cron: set up automatic mail syncing')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('699c2a43231240bae49a7280ea4b983c5025c566b109d46e27c14fad7b4d0a9359af3f32581f74426464f4e16c37dc69b75a33944237316198b79007e408077a')


package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
