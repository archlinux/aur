# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
pkgname=bytewalk
pkgver=1.0.2
pkgrel=1
pkgdesc="A firmware extraction tool & binwalk fork"
arch=("any")
url="https://gitlab.com/bytesweep/bytewalk"
license=("MIT")
source=("https://gitlab.com/bytesweep/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=("9dce1d7eb189b8f39bb682cdfc29e4c2")
depends=("python")
optdepends=(
  'python-pyqtgraph: graph and visualization support'
  'python-opengl: binviz module support'
  'python-capstone: disassembly support'
  'arj: ARJ decompression support'
  'cabextract: CAB archive support'
  'cpio: CPIO archvie support'
  'gzip: GZIP decompression support'
  'mtd-utils: JFFS filesystem support'
  'p7zip: ZIP, LZMA and ISO decompression support'
  'squashfs-tools: squashfs support'
  'tar: TAR archive support'
  'bzip2: BZIP2 archive support'
  'unrar: RAR decompression support'
  'xz: XZ decompression support'
  'firmware-mod-kit: cramfs support'
  'lhasa: LHA support'
  'sleuthkit: forensic analysis support'
)
makedepends=('git')
provides=('bytewalk')
conflicts=("bytewalk")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python setup.py install -O1 --prefix="${pkgdir}/usr"
  install -Dm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
