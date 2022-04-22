# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ez
pkgver=1.1.3
pkgrel=1
pkgdesc='Task simplificaltion scripts that increase speed and efficiency in common tasks'
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
  "bluez: To integrate EZ bluetooth manager"
  )
provides=(ez ezdl ezgc eztst ezssl)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('d2bbd4b6973a5a22fe2903d8bb62eda0a4c1d32e95f3d544306642d8b648b98e')

package() {
  install -Dm775 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for x in ezdl ezgc eztst; do
    install -Dm644 usr/share/doc/${pkgname}/${x}/README "${pkgdir}/usr/share/doc/${pkgname}/${x}/README"
  done
 }
