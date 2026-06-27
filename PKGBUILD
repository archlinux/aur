# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Epistates
_gitname=gravityfile
_appname=${_gitname}
_alias=grav
pkgname=${_appname}-bin
pkgdesc="File system explorer and analyzer with an interactive TUI"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("${_alias}-${pkgver}.bash::${_ghurlraw}/scripts/${_alias}.bash"
		"${_alias}-${pkgver}.fish::${_ghurlraw}/scripts/${_alias}.fish"
		"${_alias}-${pkgver}.zsh::${_ghurlraw}/scripts/${_alias}.zsh"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"AUDIT-${pkgver}.md::${_ghurlraw}/AUDIT_FIXES.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/CHANGELOG.md"
		"PLUGINS-${pkgver}.md::${_ghurlraw}/docs/PLUGINS.md"
		"ARCHITECTURE-${pkgver}.md::${_ghurlraw}/docs/ARCHITECTURE.md")
# source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
# source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::https://productionresultssa13.blob.core.windows.net/actions-results/6ed40e8d-1e55-4b49-8b00-db7b8d5221d3/workflow-job-run-da8a0002-ac1a-51a4-ab99-02d2949e14ef/artifacts/1bb87e07be9e52fc0dca53a1c0718fac23e8b4202b9c346e12f075762507a544.zip?rscd=attachment%3B+filename%3D%22x86_64-unknown-linux-gnu.zip%22&rsct=application%2Fzip&se=2026-06-27T00%3A54%3A25Z&sig=j3SfwVMu9eEwKIC2iKKKpGvlvzGP2gmfNyJRN45hmH4%3D&ske=2026-06-27T02%3A29%3A18Z&skoid=ca7593d4-ee42-46cd-af88-8b886a2f84eb&sks=b&skt=2026-06-26T22%3A29%3A18Z&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skv=2025-11-05&sp=r&spr=https&sr=b&st=2026-06-27T00%3A44%3A20Z&sv=2025-11-05")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::https://productionresultssa13.blob.core.windows.net/actions-results/6ed40e8d-1e55-4b49-8b00-db7b8d5221d3/workflow-job-run-34b3754e-f87f-53f1-93b1-77ae6c29aff9/artifacts/86bf552cb29f61118330fb817bc3819ddbade898c26ec8c0a3c825f4bc5e2e27.zip?rscd=attachment%3B+filename%3D%22aarch64-unknown-linux-gnu.zip%22&rsct=application%2Fzip&se=2026-06-27T00%3A55%3A14Z&sig=f4TEFOeSmpd%2Bfx%2FFRq8rtPvU9F6uNe7VhXLQbeHVmqo%3D&ske=2026-06-27T02%3A08%3A56Z&skoid=ca7593d4-ee42-46cd-af88-8b886a2f84eb&sks=b&skt=2026-06-26T22%3A08%3A56Z&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skv=2025-11-05&sp=r&spr=https&sr=b&st=2026-06-27T00%3A45%3A09Z&sv=2025-11-05")
sha256sums=('9b9fbd3c5b3494061a29b9f78957d3f888cbf5ec4ad0859efac96435be85f03e'
            '80ee5be553b56f756dc64c81c1520c6ebdf5c8c69a043a4bc65665d79b669518'
            '033531c8d865b05008b99b76c10b89d36ba4249d9aa365ae85a621202357b2bf'
            '2795063013f0f7498d460ef22570b194db597071f9261154f1ba055c6ab60189'
            'd2fb587595a98e66310d2d3152994e6f1078b82f9e8bceab42d053e18d212f73'
            '2bf1ee46f18db53ddcd81e9995afa297c121d6b5338fb1164a73c7971bd44cb6'
            'b0e28ef4f18c384121c6e9570abc1efae5907667aad82eb40589e92b173192fb'
            '769803033f68c3022a1f88e326cdb0be0ddf32c7be7d639bd7e1b177c635efb1'
            '7c29be36dad9b233df5ad0cefc361264e4ca8602172bceaabcb93dd86f1e382c'
            'dc5c24dec266c9db2d1563a335c26aa8e4c6adef64e5f572419f22231baa1d09')
sha256sums_x86_64=('22bc2d77a545409c6d201cd4ec310af02ddd8480956321934fa4b093a1d13824')
sha256sums_aarch64=('b0c18fe445afe4492127dced823b506646c5cd1083050db98cb4f496bfee4085')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

prepare() {
	cd "${srcdir}/" || exit

	tar -xvf "${_appname}-${_CARCH}.tar.gz"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_alias}-${pkgver}.zsh" "${pkgdir}/usr/share/${_appname}/${_alias}.zsh"
	install -Dm644 "${_alias}-${pkgver}.bash" "${pkgdir}/usr/share/${_appname}/${_alias}.bash"
	install -Dm644 "${_alias}-${pkgver}.fish" "${pkgdir}/usr/share/${_appname}/${_alias}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "AUDIT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUDIT.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "ARCHITECTURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

