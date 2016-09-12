# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: lp76 <l.peduto@gmail.com>

set -u
pkgname='sendemail'
pkgver='1.56'
pkgrel='2'
pkgdesc='A lightweight command line SMTP email client written in Perl'
arch=('any')
url='http://caspian.dotconf.net/menu/Software/SendEmail/'
license=('GPL')
depends=('perl' 'perl-net-ssleay' 'perl-io-socket-ssl')
source=("http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v${pkgver}.tar.gz")
source+=('sendEmail.patch')
sha256sums=('6dd7ef60338e3a26a5e5246f45aa001054e8fc984e48202e4b0698e571451ac0'
            'd25caa3959c40ea8587fe5098ee08b5e0c7b93a2a56ebe24b9c7a9c05ef4e725')

# diff -c3 sendEmail ../../../../perl/sendemail/sendEmail > ../../sendEmail.patch

package() {
  set -u
  cd "sendEmail-v${pkgver}"
  patch < '../sendEmail.patch'
  install -Dm0755 'sendEmail' "${pkgdir}/usr/bin/sendEmail"
  set +u
}
set +u
