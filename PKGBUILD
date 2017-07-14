# Maintainer: Henrik Gaßmann <henrik at gassmann dot onl>
# Contributor: Alexander Jesner <alexander at jesner dot eu>
# Forked from https://aur.archlinux.org/packages/nuget3/

pkgname=nuget4
pkgver=4.1.0
pkgrel=0
pkgdesc="Package manager for .NET."
arch=('any')
url="http://www.nuget.org"
license=('APACHE')
depends=('mono>=5.0.0' 'sh')
conflicts=('nuget', 'nuget3')
source=(https://dist.nuget.org/win-x86-commandline/v${pkgver}/nuget.exe
				'nuget')
install="${pkgname}.install"
sha384sums=('c88f175201cef01aac7eadaad8d077523cc9d8f6eb053e4c7ac6dffe810d5c36dac370de008707828193b4df330edade'
            '8cb9ce863e6b0669e28e7710a844985baf0c11626deed243d62995a2406eb135e634a4c381a757a26072edd017ea3232')

package() {
    install -d ${pkgdir}/usr/lib/nuget
    install -d ${pkgdir}/usr/bin

    install -m 0644 ${srcdir}/nuget.exe ${pkgdir}/usr/lib/nuget/nuget.exe
    install -m 0755 ${srcdir}/nuget ${pkgdir}/usr/bin/nuget
}

