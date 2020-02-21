# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=imapsync
pkgver=1.945
pkgrel=1
pkgdesc='IMAP synchronisation, sync, copy or migration tool'
arch=('any')
url='http://www.linux-france.org/prj/'
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
sha512sums=('cb8c2c545a54ae63d944fc56790595a0de9260d3451d11b43a5d58dab0c87653be633572ce1de6715334091b667187585eedd21ca12bc438abaeee2a65a1a6bd')

build() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
