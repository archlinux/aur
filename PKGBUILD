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
sha256sums=('83da51cce10f358461569023bb29364f8871185697385f9161fb4c1b025e3999')

package() {
  cd ${pkgname}
  install -Dm775 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for x in $(ls usr/doc/${pkgname}); do
    install -Dm644 usr/share/doc/${pkgname}/${x}/README "${pkgdir}/usr/share/doc/${pkgname}/${x}/README"
  done
 }
