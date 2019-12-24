# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: CrookedNixon <cn@crookednixon.com>

set -u
pkgname='smtp-cli'
pkgver='3.10'
pkgrel='1'
pkgdesc='Perl based command line SMTP client'
arch=('any')
url='http://www.logix.cz/michal/devel/smtp-cli'
license=('GPL')
depends=('perl' 'perl-io-socket-ssl' 'perl-io-socket-inet6' 'perl-mime-lite' 'perl-file-type' 'perl-term-readkey' 'perl-digest-hmac' 'perl-email-date-format')
#source=("http://www.logix.cz/michal/devel/smtp-cli/${pkgname}-${pkgver}")
_giturl="https://github.com/mludvig/${pkgname}"
_verwatch=("${_giturl}/releases.atom" '\s\+<title>v\([0-9\.]\+\)</title>.*' 'f')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mludvig/smtp-cli/archive/v${pkgver}.tar.gz")
sha256sums=('334c48a1c1c3b2a9418f98ce1ac15080cff50aab55618bbac95090e7f39ff71f')

package() {
  set -u
  install -Dpm755 "${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
