# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: 謝致邦<Yeking@Red54.com>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=gnome-system-tools
pkgver=3.0.0
pkgrel=8
pkgdesc='Cross-platform configuration utilities for GNOME'
arch=('i686' 'x86_64' 'armv7h')
url='https://en.wikipedia.org/wiki/GNOME_System_Tools'
license=('GPL2')
depends=('libtool'
	 'wireless_tools'
         'liboobs'
         'polkit-gnome'
         'libnautilus-extension'
         'dconf')
makedepends=('intltool')
install=gnome-system-tools.install
source=("${pkgname}-${pkgver}.tar.bz2::https://download.gnome.org/sources/gnome-system-tools/3.0/gnome-system-tools-3.0.0.tar.bz2"
	'po.patch'
	'01_wait_for_backends.patch'
	'10_disable_interfaces.patch'   
	'11_dont_show_shares.patch'        
	'12_fix_exit.patch'          
	'25_sambashare_group_definition.patch'
	'61_outdated_docs.patch'
	'62_no_gettext.patch'             
	'dont-ignore-oobsresult.patch'
	'gthread.patch'       
	'hide_properties.patch'
	'the_admin_group_is_sudo.patch'
	'time-libm.patch'      
	'50_fix_system_tools_pc.patch'
	'30_fix_services_admin_window.patch'
	'00_fix-missing-DATADIRNAME.patch' 
	'max_group_name_32_chars.patch'   
	'70_gst-yelp.patch'
	'configure.in.patch'
	'nautilus-shares.c.patch'
	'gst-shares-module.c.patch'
	'shares-tool.h.patch'
	'time-tool.c.patch'
       )
sha256sums=('905df26c02f00a6c2c18706ba3db7eab764e3df6576289e103504aa39a47ae0b'
	    '827c3169ae5060403b3f833b0f9c1d5cefe1d80aa5ade22e2ff7908b1ce1b5ef'
	    'c0c9c795aa2146e5dcdde32151c0bd4f406a9369b8bb0e7e1acb13ea464f1021'
	    'c94e8944bc3d4b2ccfe93e2e7cc591c9680291c2f004f63d3c5cf6a7f2a426dd'
	    '18c7f34fefda27a47805f2e3a59ea67f14a2192ced0087ce11206c6b73154520'
	    '1f8db3a6fb8592e02050e22db15a3381d3eb42557fb4dc33d59815320246015a'
	    '8c0dc77bb5a8ce9c4d9b1e4a1ab0a412d569f714cc85d3e6f41edeed441976b3'
	    '78e620f7e4ffb0d772704ad7a51cc086eed1bb3cfe074b27d114d1e7e5a3c781'
	    'f5c70b1fbc7a4f40978d5ac07825dd6377142b9f9a1be5d1b7748234a0f7aa62'
	    'f0c4d89c0a8632f93372619eb45ab47391265bbda9266b4c1d3521b1e663bca6'
	    'ec7ff45a751cb66d09bbef8ea0fa04212b81679b83171006fbcc228fa0f3e847'
	    'bc0da436f96a03224d1f04a96c2aa2850de3dfe0f8105587238147a38e6bf61f'
	    '3f75c821ccb8a809c1e789f56a9b410417ebd559282d6cdc969ec9bf9e950f5d'
	    'f766cd26bf69b9752714c1a9c35dab89078be996637e338c90e3789ec00e9cb4'
	    'e57bceb74eae4b213384370b78e93173c8c039ead4bd0b0a88067ac68b5eef96'
	    'c2766bdfbcfc8620b5bcd54231455d5671b8ca72cb650ff02e742228da7f41df'
	    '9549e4d53af2313ab9d3be5feb164f0a5115814463ccb4fa17321712ca135214'
	    '676a92841bd6b0737e02e21876808a1f83be67972149cc5ffa864a0dfe8da85b'
	    'e1a9569dc8ae06aee7165b0b04c95fd385c2bd986aed07c9f491d782d76694f6'
	    'e8c865a07c8472c63218b6553e5a0749147df7768734c21197569c316e5b6a8e'
	    'a7c431fa64a3c0a8a0326a99856302c3a2f84e83934b3cf0a1419a61f02285d3'
	    '4b9b778230ed4a2998d4e4bd9f83fae6d0014b2afcfbdf8a3a8170eded41f690'
	    '9bc8ad5d8958b93e6325d6bd2f98341d7fd251686db02a9c8a73485ccf35025b'
	    '3264deced004cb46d1659e461f9ad20244fe35c65c3b15c3e4047e0fa4ab4859'
	   )

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../../po.patch
  patch -Np1 -i ../../01_wait_for_backends.patch
  patch -Np1 -i ../../10_disable_interfaces.patch
  patch -Np1 -i ../../11_dont_show_shares.patch
  patch -Np1 -i ../../12_fix_exit.patch
  patch -Np1 -i ../../25_sambashare_group_definition.patch
  patch -Np1 -i ../../61_outdated_docs.patch
  patch -Np1 -i ../../dont-ignore-oobsresult.patch
  patch -Np1 -i ../../gthread.patch
  patch -Np1 -i ../../hide_properties.patch
  patch -Np1 -i ../../the_admin_group_is_sudo.patch
  patch -Np1 -i ../../time-libm.patch
  patch -Np1 -i ../../50_fix_system_tools_pc.patch
  patch -Np1 -i ../../30_fix_services_admin_window.patch
  patch -Np1 -i ../../00_fix-missing-DATADIRNAME.patch
  patch -Np1 -i ../../max_group_name_32_chars.patch
  patch -Np1 -i ../../70_gst-yelp.patch
  patch -Np1 -i ../../configure.in.patch
  patch -Np1 -i ../../nautilus-shares.c.patch
  patch -Np1 -i ../../gst-shares-module.c.patch
  patch -Np1 -i ../../shares-tool.h.patch
  patch -Np1 -i ../../time-tool.c.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    libtoolize
    aclocal -I .
    autoheader
    autoconf
    automake --add-missing -c
#    cd network
#    aclocal
#    autoconf
  ./configure --prefix=/usr  --sysconfdir=/etc \
        --localstatedir=/var --disable-scrollkeeper --disable-static \
        --disable-services --disable-schemas-compile LIBS="-lm -lgthread-2.0"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
