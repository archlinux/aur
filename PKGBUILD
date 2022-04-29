# Maintainer :       Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard
pkgver=3.3
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
b2sums=('4f3017bdd475aa04973f7884fb95cbae74d7427dc0176df730c2a6f4b0d6db44edb2d640383a4fab749050217407a2b777757252f5cd73b6a0d288ed1ad9bf74')


package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
