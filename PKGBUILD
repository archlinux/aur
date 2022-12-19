# Maintainer: KAAAsS <admin [at] kaaass dot net>
# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.yunkanpan.numnode
pkgver=1.2.3.1
pkgrel=2
pkgdesc="欢迎使用云看盘软件"
arch=("x86_64")
install=
url="http://yunkanpan.com/"
license=("custom")
depends=()
optdepends=('ttf-ms-win10: Microsft Fonts recommended'
            'ttf-ms-fonts: Microsft Fonts recommended')
options=(!strip)
provides=('yunkanpan')
source=("http://cdn.yunkanpan.com/static/download/com.yunkanpan.numnode_${pkgver}_amd64_manjaro.tar.gz"
        "start.sh"
        "com.yunkanpan.numnode.desktop"
        "com.yunkanpan.numnode.svg")
sha512sums=(
    91ed4c356f85c2bd9899a0c668f0e4437d8ef4fbdfd0d9bfbeb08c8ea41614489a185e89af39f85a777546612185126f4c9b3af83628a7f149399c454e61bb70
    0a5e2368c8f81e05442e371e0d36e00cb2c709f46b5cf70542d548d083a8d37b684c55734ae852e7954882041f9cacd8f49dfbb0579cc6f13eb2165cdf1f2058
    7271acb7e31994557dafd3094b806fbccccfdbcb61824766b48d79392ba4886079f3c91b76b6db6ea4d0c383dc09d0d8b9f4264a9c6732cce1916ba3a58f5ba5
    8a6bedb185606de86d84d126aba4126dc965ad7aec746c3231a83b7e31aef80c94695740c399790f33cec750aafec56ee18e66cb12794c698d76e8ed3530ebb1
)

package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/{applications,icons}
    mv com.yunkanpan.numnode.desktop ${pkgdir}/usr/share/applications
    mv com.yunkanpan.numnode.svg ${pkgdir}/usr/share/icons
    
    mkdir -p ${pkgdir}/opt/yunkanpan
    rm -rf com.yunkanpan.numnode_${pkgver}_amd64_manjaro/logo
    mv com.yunkanpan.numnode_${pkgver}_amd64_manjaro/* ${pkgdir}/opt/yunkanpan

    mv ${srcdir}/start.sh ${pkgdir}/opt/yunkanpan/
    chmod a+x ${pkgdir}/opt/yunkanpan/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/yunkanpan/start.sh ${pkgdir}/usr/bin/yunkanpan
    
    rm ${pkgdir}/opt/yunkanpan/libstdc++.so.6
    ln -s /usr/lib/libstdc++.so.6 ${pkgdir}/opt/yunkanpan/libstdc++.so.6
    
    chmod -R 777 ${pkgdir}/opt/yunkanpan
}
 
