# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Aquila Deus <aquila.deus@gmail.com>
# Contributor: Vinay Shastry <vinayshastry@gmail.com>

pkgname=aqua-data-studio
pkgver=16.0.10
pkgrel=1
pkgdesc="An universal database query tool and administration tool"
arch=('any')
url="http://www.aquafold.com/"
license=('custom')
depends=('java-runtime' 'libgl')
options=('!strip')
source=(http://dd1.aquafold.com/download/v16.0.0/linux/ads-linux-novm-$pkgver.tar.gz
        datastudio.sh)
sha256sums=('f5091910b66daaa7f6ffaf56615077ab6a7fda31d05de13ee36c33bbab9c3d51'
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
