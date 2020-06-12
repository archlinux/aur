# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=imapsync
pkgver=1.945
pkgrel=1
pkgdesc='IMAP synchronisation, sync, copy or migration tool'
arch=('any')
url='https://github.com/imapsync/imapsync'
license=('GPL')
depends=('cpanminus' 'perl-cgi' 'perl-crypt-openssl-rsa' 'perl-data-uniqid' 'perl-date-manip'
        'perl-file-copy-recursive' 'perl-file-tail' 'perl-html-parser' 'perl-io-socket-inet6'
        'perl-io-socket-ssl' 'perl-io-tee' 'perl-json-webtoken' 'perl-libwww' 'perl-module-scandeps'
        'perl-mail-imapclient' 'perl-module-runtime' 'perl-ntlm' 'perl-package-stash'
        'perl-par-packer' 'perl-readonly' 'perl-regexp-common' 'perl-sys-meminfo'
        'perl-term-readkey' 'perl-test-deep' 'perl-test-fatal' 'perl-test-mock-guard'
        'perl-test-mockobject' 'perl-test-pod' 'perl-test-requires' 'perl-test-warn'
        'perl-unicode-string')
source=("https://github.com/imapsync/imapsync/archive/${pkgname}-${pkgver}.tar.gz")
b2sums=('98ef55135239ed9625fdce9e8944c2f7a8c8c1b1020c383bbda4f3e18a486b5b691e22faaa896b21e897babb04954d548ff65bf04e79db719a1e8636f0e5e3fd')

build() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
