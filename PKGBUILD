# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ez
pkgver=1.0.5
pkgrel=1
pkgdesc='Task simplificaltion scripts for increasing the speed and efficiency of common tasks'
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
optdepends=(
  "git: To use ezgc for cloning repositories"
  "npm: To download npm packages with ezdl"
  "snapd: To install snap packages with ezdl"
  "python-pip: To install python packages with ezdl"
  "lf: To integrate the lf file manager with eztst"
  )
provides=(ez ezdl ezgc eztst ezssl)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('a994bfb2cd1618c5580274fd69bb4083ee1e6c89d5a8b9832d365f01411f8968')

package() {
  install -Dm775 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for x in ezdl ezgc eztst ezssl; do
    install -Dm644 usr/share/doc/${pkgname}/${x}/README "${pkgdir}/usr/share/doc/${pkgname}/${x}/README"
  done ; }
