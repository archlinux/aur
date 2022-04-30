# Maintainer :       Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard
pkgver=3.3.1
pkgrel=1

pkgdesc='Easily auto-configure neomutt and isync/mpop with safe passwords (IMAP/POP3/SMTP)'
arch=('any')
url="https://github.com/lukesmithxyz/$pkgname"
license=('GPL3')

depends=('neomutt' 'isync' 'msmtp' 'notmuch-runtime' 'pass' 'curl' 'libnotify' 'perl')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
            'protonmail-bridge: use neomutt with protonmail accounts'
            'pam-gnupg: automatically unlock gpg keys at session login'
            'cron: set up automatic mail syncing'
            'mpop: if you want to use POP3 email access')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('8f900700349441fb1d80e16697c2310d4a9319d8abb655657306bced8826b3a31b31e89146eef89610c18ff3eae39462a43670148336de527ffd7434c78d6ce2')


package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
