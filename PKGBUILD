# Maintainer: Helhet <hhdev@proton.me>

pkgname=brother-hl5250dn-cups-ppd
pkgver=2.0.1_2
pkgrel=1
pkgdesc="CUPS wrapper print driver and PPD file for Brother HL-5250DN"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl5250dn_all"
license=("EULA")
groups=("base-devel")
source=(
  'https://download.brother.com/welcome/dlf005986/cupswrapperHL5250DN-2.0.1-2.i386.deb'
  'https://download.brother.com/welcome/dlf005987/BR5250_2_GPL.ppd.gz'
)
md5sums=("c4f27115360e9293346ac3a0ed39fca4"
         "8a395079334634f348d1cd7bcee8170b")
depends=('cups')
optdepends=('psutils'
            'ghostscript'
            'mupdf'
            )

package() {
    tar -xf data.tar.gz -C "${pkgdir}"
    # Add .ppd
    install -m 644 -D BR5250_2_GPL.ppd "$pkgdir/etc/cups/ppd/BR5250_2_GPL.ppd"
}

