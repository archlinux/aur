# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.csstidy

pkgname=csstidy
pkgver=2.2.1
pkgrel=2
pkgdesc="A program that optimises, formats and fixes CSS code"
arch=('any')
url="https://github.com/Cerdic/CSSTidy"
license=('LGPL-2.1-or-later')
depends=('php')
conflicts=('csstidy-cpp-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Cerdic/CSSTidy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ea2334948f114f067a9f9cce630e239c42696d1909c830cd6678b709754eeed')

package() {
  cd "CSSTidy-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/csstidy"
  install -m644 class.csstidy.php class.csstidy_optimise.php class.csstidy_print.php \
    data.inc.php lang.inc.php \
    template.tpl template1.tpl template2.tpl template3.tpl \
    "${pkgdir}/usr/share/csstidy/"
  install -Dm755 bin/pcsstidy "${pkgdir}/usr/share/csstidy/bin/pcsstidy"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /usr/share/csstidy/bin/pcsstidy "${pkgdir}/usr/bin/csstidy"
}
