#Maintainer: MCdianhei <mcdianhei@gmail.com>
pkgname=plandex-bin
pkgver=2.2.1 # 修改为 GitHub 上的最新版本号
pkgrel=1
pkgdesc="AI-powered development agent for your CLI" # 软件描述
arch=('x86_64' 'aarch64') # 支持的架构
url="https://github.com/plandex-ai/plandex" # 项目主页
license=('MIT') # 替换为软件实际的开源协议
depends=() # 运行所需的依赖（如果没有就留空）
provides=('plandex')
conflicts=('plandex')

# 定义不同架构的下载源
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/plandex-ai/plandex/releases/download/cli%2Fv${pkgver}/plandex_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/plandex-ai/plandex/releases/download/cli%2Fv${pkgver}/plandex_${pkgver}_linux_arm64.tar.gz")

# 对应的哈希值，先填 'SKIP'，后面我们会用工具自动生成
sha256sums_x86_64=('2094c11700bef5dc87369214d3da6d9a8a76c1d2e51459045f0c8268fdaeabc9')
sha256sums_aarch64=('5539441719cd8dc34f7209e5a04051540e748ff97d0d85b1cf79035b6cef7920')

package() {
    # 进入解压后的目录（根据实际解压出来的结构调整，如果压缩包里直接是二进制文件，这一步可能不需要）
    # cd "${srcdir}" 
    # 确保直接在 srcdir 寻找二进制文件
    install -Dm755 "${srcdir}/plandex" "${pkgdir}/usr/bin/plandex"

    # 将二进制文件安装到系统的 /usr/bin/ 目录下，并赋予可执行权限
    install -Dm755 "${srcdir}/plandex" "${pkgdir}/usr/bin/plandex"
    
    # 如果有 LICENSE 文件，也可以顺便安装
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
