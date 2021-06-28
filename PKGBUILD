# Maintainer :       Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard
pkgver=3.2.1
pkgrel=2

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
            'cron: set up automatic mail syncing'
            'mpop: if you want to use POP3 email access')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('60087ca8b6cfe2f69e1f078942ef24be8d387fbadcacfdf0105e6ee6df315a57fb21320635b685dad5e5e15860adb9cef147dc9b029d77bfdfd196f219faca91')


package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
