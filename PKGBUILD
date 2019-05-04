# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='oki-b700-es7100'
pkgver='1.28'
pkgrel='1'
pkgdesc='CUPS printer driver for the Okidata B710n B720n B730n ES7120 ES7130'
arch=('any')
url='http://www.okidata.com/'
license=('custom')
depends=('cups')
options=('!strip')
source=('https://www.oki.com/printing/download/B700_ES7100%20Linux%20PPDs.tar_66073.gz' 'oki-license.txt')
sha256sums=('2f215db52d20ad546e57c90313c5c83315687c9b670ab3285406ba0e7b71c68e'
            '83601a5d73a82adca542777942cba50c28e4f0033be00916e2de59e14b80bc73')

prepare() {
  set -u
  sed -e 's:\r$::g' -i *.ppd
  set +u
}

package() {
  set -u
  install -Dpm644 'oki-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 *.ppd* -t "${pkgdir}/usr/share/cups/model"
  set +u
}
set +u
