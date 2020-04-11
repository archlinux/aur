pkgname='remoteplaydetached-bin'
pkgbase='remoteplaydetached'
_pkgname='RemotePlayDetached'
pkgver=v0.4
pkgrel=1
pkgdesc='A simple launcher that is able to launch any external game or application with Steam Remote Play Together Support'
arch=('x86_64')
source=("https://github.com/smaTc/RemotePlayDetached/releases/download/${pkgver}/RemotePlayDetached")
sha256sums=('2f44b3a7f654a4c0f750a9bb56e63a6133271d90501ac3149ba6f2ad7bc86ceb')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
     
    curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/remoteplaydetached.desktop > remoteplaydetached.desktop
    sed -i "s#user#${USER}#g" remoteplaydetached.desktop
    mv remoteplaydetached.desktop ~/.local/share/applications
    
    
    curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/resources/logo.png > remoteplaydetached.png
    mv remoteplaydetached.png ~/.icons/
    cd ~/
    mkdir RemotePlayDetached
    cd RemotePlayDetached/
    curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/uninstall.sh > uninstall.sh
    chmod +x uninstall.sh
}
