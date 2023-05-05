# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>

pkgname=bitronics-studio-5-bin
pkgver=5.3.8
pkgrel=2
pkgdesc="Software for \"Юный Нейромоделист\" setup by BiTronicsLab."
arch=('x86_64')
url="https://bitronicslab.com"
license=('custom')
depends=('fontconfig>=2.11.0'
         'freetype2>=2.6'
         'glibc>=2.17'
         'libdrm>=2.4.62'
         'libglvnd>=1.6.0' # debtap considered 'libegl>=7.8.1' for file /usr/lib/libEGL.so.1
         'libgl'
         'libx11'
         'libxcb>=1.10'
         'libxkbcommon>=0.5.0'
         'libxkbcommon-x11>=0.5.0'
         'gcc-libs'
         'xcb-util-image>=0.2.1'
         'xcb-util-keysyms>=0.4.0'
         'xcb-util-renderutil'
         'xcb-util-wm>=0.4.1'
         'zlib>=1.2.3.4')
install="${pkgname}.install"
source_x86_64=("https://www.download.bitronicslab.com/YN/soft/BS_YN/linux/BTStudio5JN-5.3.8.deb")
sha512sums_x86_64=('6bada78349ebc602baa2535cc02b4f75b8d50d570ab1b3c32a7cedf8f4ce3c2f6fd841230a2a0957e83e764de3d27ec0f87e029a3169c9a595232fca07799fd3')

package(){
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}" --no-same-owner

    # to match arch disto access mask
    chmod -R 755 "${pkgdir}"

    # not to install original deb file
    rm "${pkgdir}/BTStudio5JN-5.3.8.deb"
}
