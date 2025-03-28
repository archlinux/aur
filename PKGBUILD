#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="A self-hosted dashboard that puts all your feeds in one place"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/glanceapp/glance"
license=('AGPL-3.0-only')
conflicts=('glance')
provides=("glance=${pkgver}")
source=("https://raw.githubusercontent.com/glanceapp/glance/refs/tags/v${pkgver}/docs/glance.yml"
        "glance.service"
        "sysusers.conf"
        "tmpfiles.conf")
b2sums=('0baa5f20c637fe3b4e2c4c91c992dd827bbbd7092727e3a9ebeda92d6a766a6cf56d0476930c0f0aa3b63791d13d0ffa752112425b7ed67fa14d8d50a192de4b'
        '6c9f854855cf366eb47847f90c8ed38c531a71ef329575863cd570c5dc46849e5f34ae6549ec214652c1413debdf512646775fd163e149b5c89e99511644edf2'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')
b2sums_x86_64=('039006c51f74a4d016428e2ee9d03165dde8a101b9865c2fd7cbee51634704428116812d607ad8af86b28f36ba697b7ab62820ba96efe4679b9c0a3f01c14d41')
b2sums_i686=('cf22f72e54f05f4547192057610a7effd25582ffce50be4cd9a178f5d2df81bf9b8b9a0fae914bde8c393d8f5ed5ced8d49215966da5d24cd0538202131067cb')
b2sums_armv7h=('fd535fedbf311e02e845a295c3c56d5f89915bc6a5d7303fb908dfe6890c238f61afdafb4b403880d642df10e2fb32a139ff6be8160687deb4f782aab19a51b2')
b2sums_aarch64=('ee76eedebcfafa4a453db924fc69020a86ce52a3347403c01632d3b32804a31d46357bac4aa1ca8c20fcb9d3a6ad3e91caeaa20c158e0225c94798e5a4d1b640')
source_x86_64=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-amd64.tar.gz")
source_i686=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-386.tar.gz")
source_aarch64=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-arm64.tar.gz")
source_armv7h=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-armv7.tar.gz")
backup=('etc/glance.yml')

package() {
    install -Dm755 "glance" "$pkgdir/usr/bin/glance"
    install -Dm644 glance.service "$pkgdir/usr/lib/systemd/system/glance.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/glance.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/glance.conf"
    install -Dm644 "glance.yml" "$pkgdir/etc/glance.yml"
}
