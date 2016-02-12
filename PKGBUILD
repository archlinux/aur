# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Aquila Deus <aquila.deus@gmail.com>
# Contributor: Vinay Shastry <vinayshastry@gmail.com>

pkgname=aqua-data-studio
pkgver=17.0.3
pkgrel=1
pkgdesc="An universal database query tool and administration tool"
arch=('any')
url="http://www.aquafold.com/"
license=('custom')
depends=('java-runtime' 'libgl')
options=('!strip')
source=(http://dd1.aquafold.com/download/v17.0.0/linux/ads-linux-novm-$pkgver.tar.gz
        datastudio.sh)
sha256sums=('a0d267af89224fdec94b382e2a07543672b34b437605cde47685b51d71d228d0'
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
