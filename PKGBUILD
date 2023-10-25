# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A
# Contributor: puleiya <ninettristan@gmail.com>
pkgname=zedpro
pkgver=2023.2
pkgrel=1
pkgdesc="Zed! Encrypted containers manager"
arch=("i686" "x86_64")
url="http://www.primx.eu"
license=("Prim'X")
depends=("libxslt" "qt5-base" "hicolor-icon-theme" "libldap25" "unzip" "zstd" "deb2targz")
conflicts=("zedfree")
options=("!strip" "!emptydirs")
install=${pkgname}.install
source_i686=("https://www.zedencrypt.com/file/get/-/item_key/13802-26-7fd209fe")
source_x86_64=("https://www.zedencrypt.com/file/get/-/item_key/13802-25-299e76f8")
sha512sums_i686=("750d5db2312ca364808be78394f58272ad305d84554266f00b0658ec78a701d20ab924e7c49888f03d4d506be7d5c82fcad673f464bad4eef87b11b983bbe966")
sha512sums_x86_64=("99fbaf55d5304cea5f4fbc2b5eb12b498102e21e259146433c61ec5fd88e637f920434546660d3957b7dbd129af208387dc92af991ec5bf4c11edc73d6322bb6")

build() {
        # Extract Debian installation packages from Zip file
        #unzip 13802-25-299e76f8 -d "${srcdir}"
        
        # Extract package data from Debian packages
        cd ${srcdir}
        deb2targz Ubuntu\ 22.04/ZEDPRO-2023.2.Ubuntu22.04.amd64.deb
        unzstd Ubuntu\ 22.04/ZEDPRO-2023.2.Ubuntu22.04.amd64.tar.zst
}

package(){
	# Extract package data
	tar --extract -f "${srcdir}"/Ubuntu\ 22.04/ZEDPRO-2023.2.Ubuntu22.04.amd64.tar -C "${pkgdir}"

        find "${pkgdir}" -type d -print0 | xargs -0 chmod 755
}
