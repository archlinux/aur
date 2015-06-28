# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Aquila Deus <aquila.deus@gmail.com>
# Contributor: Vinay Shastry <vinayshastry@gmail.com>

pkgname=aqua-data-studio
pkgver=16.0.5
pkgrel=1
pkgdesc="An universal database query tool and administration tool"
arch=('any')
url="http://www.aquafold.com/"
license=('custom')
depends=('java-runtime' 'libgl')
options=('!strip')
source=(http://dd1.aquafold.com/download/v16.0.0/linux/ads-linux-novm-$pkgver.tar.gz
        datastudio.sh)
sha256sums=('fab5f2e8dbbd627e64053274bb5d3236a73bde3f1ba25260328d2c6a3c6e9f8c'
            '6f52bcac1d29fd7ee33bba4475bfaae575a7a971fd1f8084ff6449fcc890e3e5')

package() {
  cd "${srcdir}"/datastudio
  install -d "${pkgdir}"/usr/{bin,lib/datastudio}

  install -Dm755 "${srcdir}"/datastudio.sh "${pkgdir}"/usr/bin/datastudio
  cp -rd * "${pkgdir}"/usr/lib/datastudio

# Licenses
  install -Dm644 License.txt "${pkgdir}"/usr/share/licenses/aqua-data-studio/LICENSE
  cp ./license/* "${pkgdir}"/usr/share/licenses/aqua-data-studio/
}
