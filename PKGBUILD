# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor : Aaron Griffin <aaron@archlinux.org>

pkgname=slim-themes
pkgver=1.2.3
pkgrel=9
pkgdesc="Themes Pack for Simple Login Manager"
arch=('any')
url="https://sourceforge.net/projects/slim.berlios/"
license=('GPL')
depends=('slim')
source=(https://downloads.sourceforge.net/project/slim.berlios/slim-$pkgver-themepack1a.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-lake.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-fingerprint.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-flat.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-lunar-0.4.tar.bz2
        https://downloads.sourceforge.net/project/slim.berlios/slim-previous.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-rainbow.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-rear-window.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-scotland-road.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-subway.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-wave.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-zenwalk.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-archlinux-simple.tar.gz
        https://downloads.sourceforge.net/project/slim.berlios/slim-debian-moreblue.tar.bz2)
sha256sums=('244b7326157eee947348ce4b48a1d62587600affaded9bc4ad4199a2d6f1825b'
            'f7d662e37068a6c64cbf910adf3c192f1b50724baa427a8c9487cb9f7ed95851'
            '48b703f84ce7b814cda0824f65cafebf695cd71a14166b481bb44616097d3144'
            '0092d531540f9da8ef07ad173e527c4ef9c088d04962d142be3c11f0c5c0c5e9'
            '1543eb45e4d664377e0dd4f7f954aba005823034ba9692624398b3d58be87d76'
            '1f2a69f8fc0dc8ed8eb86a4c1d1087ba7be486973fb81efab52a63c661d726f8'
            'd83e3afdb05be50cff7da037bb31208b2c152539d1a009740b13857f5f910072'
            '0b123706ccb67e94f626c183530ec5732b209bab155bc661d6a3f5cd5ee39511'
            'fd60a434496ed39b968ffa1e5457b36cd12f64a4e2ecedffc675f97ca3f3bba1'
            '0205568e3e157973b113a83b26d8829ce9962a85ef7eb8a33d3ae2f3f9292253'
            'be75676da5bf8670daa48379bb9cc1be0b9a5faa09adbea967dfd7125320b959'
            'f0f41d17ea505b0aa96a036e978fabaf673a51d3f81a919cb0d43364d4bc7a57'
            '7d60d6782fa86302646fe67253467c04692d247f89bdbe87178f690f32b270db'
            '5b76929827d4a4d604ddca4f42668cca3309b6f7bd659901021c6f49d6d2c481')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}"/usr/share/slim/themes

  for t in capernoited debian-moreblue fingerprint flat flower2 isolated lake \
           lotus-midnight lotus-sage mindlock parallel-dimensions previous \
           rainbow rear-window scotland-road subway wave; do
    install -dm755 "${pkgdir}"/usr/share/slim/themes/$t
    install -m644 $t/* "${pkgdir}"/usr/share/slim/themes/$t
  done

  install -dm755 "${pkgdir}"/usr/share/slim/themes/archlinux
  install -m644 slim-archlinux-simple/* "${pkgdir}"/usr/share/slim/themes/archlinux

  install -dm755 "${pkgdir}"/usr/share/slim/themes/lunar
  install -m644 slim-lunar-0.4/* "${pkgdir}"/usr/share/slim/themes/lunar

  install -dm755 "${pkgdir}"/usr/share/slim/themes/zenwalk
  install -m644 Zenwalk/* "${pkgdir}"/usr/share/slim/themes/zenwalk
}
