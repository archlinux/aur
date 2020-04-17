# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>

pkgname=foldingathome
pkgver=7.6.8
pkgrel=1
pkgdesc='A distributed computing project for simulating protein dynamics'
arch=(x86_64)
url=https://foldingathome.org/
license=(custom)
depends=(
  gcc-libs
  glibc
  zlib
)
optdepends=(
  'cuda: for folding with an NVIDIA GPU'
  'opencl-amd: for folding with a newer AMD GPU'
  'opencl-mesa: for folding with an older AMD GPU'
  'opencl-nvidia: for folding with an NVIDIA GPU'
)
backup=(etc/foldingathome/config.xml)
source=(
  https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${pkgver%.*}/fahclient_${pkgver}-64bit-release.tar.bz2
  foldingathome.service
)
sha256sums=('588253c0042dcb0a6b97c9e16ccb8189b316df051094be4202881120255e5d31'
            'c264dc6955b5f9cc85bd48a60e23a8b0e6fa01e0a7a636bb189d8e0c507df24c')

package() {
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHClient -t "${pkgdir}"/usr/bin/
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHCoreWrapper -t "${pkgdir}"/usr/bin/
  install -Dm 644 fahclient_${pkgver}-64bit-release/CHANGELOG.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/README.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/copyright -t "${pkgdir}"/usr/share/licenses/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/sample-config.xml "${pkgdir}"/etc/foldingathome/config.xml
  install -Dm 644 foldingathome.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
