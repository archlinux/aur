# Maintainer: 4censord <mail@business-insulting.de>

pkgbase=xe-guest-utilities-xcp-ng
pkgname=('xe-guest-utilities-xcp-ng' 'xenstore-xcp-ng')
pkgver=7.11.0
pkgrel=1
pkgdesc="XCP-NG XenServer Tools"
arch=('i686' 'x86_64')
license=('CUSTOM')
source=('file://xe-guest-utilities_7.11.0-1_all.tgz' 'xe-linux-distribution.service' )
md5sums=('622dd4487e346869e730da235c8c1c30' '18d34f1ac7f9a91d4d0651e15cc8a3a9')


package_xenstore-xcp-ng() {
  install -Dm644 $srcdir/usr/share/doc/xe-guest-utilities_7.11.0/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/usr/bin/xenstore $pkgdir/usr/bin/xenstore
  cd $pkgdir
  ln -s /usr/bin/xenstore usr/bin/xenstore-exists 
  ln -s /usr/bin/xenstore usr/bin/xenstore-read   
  ln -s /usr/bin/xenstore usr/bin/xenstore-rm     
  ln -s /usr/bin/xenstore usr/bin/xenstore-write  

}

package_xe-guest-utilities-xcp-ng(){
  depends=('xenstore-xcp-ng' 'bash')
  install -Dm644 $srcdir/usr/share/doc/xe-guest-utilities_7.11.0/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 $srcdir/usr/sbin/xe-daemon $pkgdir/usr/bin/xe-daemon
  install -Dm644 $srcdir/usr/sbin/xe-linux-distribution $pkgdir/usr/bin/xe-linux-distribution
  install -Dm644 $srcdir/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules $pkgdir/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules
  install -Dm644 $srcdir/xe-linux-distribution.service $pkgdir/usr/lib/systemd/system/xe-linux-distribution.service
}
