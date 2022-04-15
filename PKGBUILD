# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ez
pkgver=1.0.4
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
provides=(ezdl ezgc eztst ezssl)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('dcbe0b1002adaf59167b62e68eaeb49ceb91b24e33ec918fca425a5f12347c3d')

package() {
  install -Dm775 usr/bin/* -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
