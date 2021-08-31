# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Aquila Deus <aquila.deus@gmail.com>
# Contributor: Vinay Shastry <vinayshastry@gmail.com>

pkgname=aqua-data-studio
pkgver=22.0.1
pkgrel=3
pkgdesc="An universal database query tool and administration tool"
arch=('any')
url="https://www.aquafold.com/"
license=('custom')
depends=('java-runtime' 'libgl')
options=('!strip')
source=(https://downloads.aquafold.com/v22.0.0/linux/ads-linux-novm-${pkgver}.tar.gz
        datastudio.sh)
sha256sums=('c0cc83ab694e543e370d4543822f141cc365db8b7575a24f2bcb9a9d113ff960'
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
